# frozen_string_literal: true

scheduler = Rufus::Scheduler.new
scheduler.in '2s' do
  CreateBadgeHistoryJob.perform_now
end
