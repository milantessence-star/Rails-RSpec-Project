require 'rails_helper'

RSpec.describe UserJob, type: :job do
  describe "Enqueue Job" do
    it "Enqueue SampleJob" do
        run_at = 10.seconds.from_now
        user = User.create!(name: "Milankumar Jaysukhbhai Thesiya", email: "milan@gmail.com", age: 23)
        clear_enqueued_jobs
        expect {
            UserJob.set(wait_until: run_at).perform_later(user)
        }.to have_enqueued_job(UserJob)
         .with(user)
         .on_queue("default")
         .at(run_at)
        expect(UserJob.new.queue_name).to eq("default")
        expect {
            perform_enqueued_jobs do
                UserJob.set(wait_until: run_at).perform_later(user)
            end
        }.to change(User, :count).by(-1)
        clear_enqueued_jobs
    end
  end
end
