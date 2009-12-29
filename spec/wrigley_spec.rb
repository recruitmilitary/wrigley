# -*- coding: utf-8 -*-
require 'spec/spec_helper'

describe "Wrigley" do
  describe "Job" do
    it 'should fetch jobs from all pages' do
      Wrigley::Job.all.size.should == 26
    end

    describe "attribute parsing" do
      before(:each) do
        @jobs = Wrigley::Job.all
        @job = @jobs.first
      end

      it 'should extract the job id' do
        @job.job_id.should == "4262"
      end

      it 'should extract the job title' do
        @job.title.should == "QA Packaging Engineer"
      end

      it 'should extract the location' do
        @job.location.should == "US-IL-Yorkville"
      end

      it 'should extract the country from the location' do
        @job.country.should == "US"
      end

      it 'should extract the state from the location' do
        @job.state.should == "IL"
      end

      it 'should extract the city from the location' do
        @job.city.should == "Yorkville"
      end

      it 'should extract the posted date' do
        @job.posted_date.should == Date.new(2009, 12, 21)
      end

      it 'should extract the link to the full job description' do
        @job.link.should == "http://jobs-wrigley.icims.com/jobs/4262/job"
      end

      it 'should extract the job category' do
        @job.category.should == "Innovation - Quality Assurance"
      end

      it 'should extract the overview' do
        @job.overview.should == "Wm. Wrigley Jr. Company is a recognized leader in confections with a wide range of product offerings including gum, mints, hard and chewy candies, lollipops, and chocolate. The company has operations in more than 40 countries and distributes its world-famous brands in more than 180 countries. Three of these brands - Juicy Fruit®, Wrigley's Spearmint®, and Altoids® - have heritages stretching back more than a century. Other well-loved brands include Orbit®, Extra®, Starburst®, Doublemint®, Skittles®, Freedent®, Airwaves®, Life Savers®, Eclipse®, and Winterfresh®. Wrigley is headquartered in Chicago, Ill., and operates as a subsidiary of Mars, Incorporated, a private, family-owned company founded in 1911. Mars, Incorporated is one of the world's largest food companies, generating global revenues of $30 billion annually and producing some of the world's leading brands in six segments that include Chocolate, Drinks, Food, Petcare, Symbioscience and Wrigley. As an integral part of the Quality Assurance Team, this position develops, recommends, engineers and implements product and process initiatives that will reduce business expenses and increase productivity."
      end

      it 'should extract the responsibilities' do
        @job.responsibilities.should == "Provide leadership in the identification and implementation of product and process improvement opportunities that result in productivity gains.Conduct time and work studies to optimize current production systems in the plant.Compile and calculate the technical data covering capacity and mechanical requirements of existing equipment. Develop action plans with Operations, Innovation, Engineering and QA teams to insure that product specifications, procedures and sampling programs are appropriate and meet system capability and key consume requirements.Using Total Productivity Management principles, collect, analyze and interpret process data to make quality evaluations, recommend actions for improvement and assure resolution.Provide risk assessment analysis. Manage issue with non-conforming packaging materials to ensure proper control, minimize losses and provide analysis to eliminate future occurrences.Review plans for new process and product system and ensure an effective product safety and sanitation design.Ensure facility meets all GMP, Regulatory, sanitation and product safety guidelines. Provide technical expertise to resolve problem areas.Develop and implement quality systems that ensure quality materials from suppliers for packaging materials.Develop cohesive working relationship with packaging vendors.Troubleshoot packaging issues in the factory and provide resolution to improve Overall Equipment Effectiveness results.Provide testing recommendations for packaging materials to ensure conformance to specification.Develop packaging specification. Packaging fabrication requirements and audits and how these relate to consumer complaints.Coordination and execution of plant tests on various materials.With Operations and Procurement, lead projects for the development and execution of production system productivity improvements and cost reductions."
      end

      it 'should extract the requirements' do
        @job.requirements.should == "Technical degree (industrial or Mechanical Engineering, Bachelor of Science)2+ years experience of demonstrated results in industrial engineering in a manufacturing environment, preferrrably in a food industry.Familiarization with processing and packaging equipment.Knowledge of product protection programs and quality process systems.Excellent computer skills including Excel, Word and Oracle database.Strong analytical and applied problem solving skills.Six Sigma certification and TPM knowledge a plus.Working knowledge of design tools such as Design of Experiments (DOE) and Failure Mode and Effects Analysis (FMEA)Solid project management skills.Ability to work effectively with a variety of people and departments, effective in teams.Proactive in addressing issues and seeking improvement opportunities.Good written and verbal communication skills; able to effectively and professionally communicate."
      end
    end
  end
end
