require 'uri'
require 'open-uri'
require 'nokogiri'

module Wrigley
  JOB_SEARCH_URI = 'http://jobs-wrigley.icims.com/jobs/search?pr=1'

  class Job
    def self.all
      parse(JOB_SEARCH_URI)
    end

    def self.parse(uri, current_page_number = 1)
      page = open(uri).read
      doc  = Nokogiri::HTML(page)
      next_page_uri = URI.parse(doc.search("td.iCIMS_JobsTablePaging a").last["href"])
      next_page_number = next_page_uri.query.split("=").last.to_i

      jobs = []
      doc.search("table.iCIMS_JobsTable tr").each_with_index do |tr, index|
        next if index == 0 # skip header
        tds = tr.search("td")
        id = tds[0].text.strip
        title = tds[1].text.strip
        location = tds[2].text.strip
        posted_date = Date.parse(tds[3].text.strip)
        link = tds[1].at("a")["href"]
        jobs << Job.new(id, title, location, posted_date, link)
      end
      jobs.push(*parse(next_page_uri, next_page_number)) if current_page_number < next_page_number
      jobs
    end

    attr_reader :job_id, :title, :location, :posted_date, :link
    def initialize(job_id, title, location, posted_date, link)
      @job_id = job_id
      @title = title
      @location = location
      @posted_date = posted_date
      @link = link
    end

    def city
      split_location[2]
    end

    def state
      split_location[1]
    end

    def country
      split_location[0]
    end

    def category
      doc.search("table.iCIMS_JobHeaderTable tr:nth-of-type(2) td:last-of-type").text
    end

    def overview
      details[3].text
    end

    def responsibilities
      details[4].text
    end

    def requirements
      details[5].text
    end

    private
    def split_location
      @split_location ||= location.split(/-/)
    end

    def details
      @details ||= doc.search("td.iCIMS_InfoMsg.iCIMS_InfoMsg_Job")
    end

    def page
      @page ||= open(link).read
    end

    def doc
      @doc ||= Nokogiri::HTML(page)
    end
  end
end
