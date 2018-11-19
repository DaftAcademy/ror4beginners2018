# frozen_string_literal: true

require "active_job"

module ActionMailer
  # Provides helper methods for testing Action Mailer, including #assert_emails
  # and #assert_no_emails.
  module TestHelper
    include ActiveJob::TestHelper

    # Asserts that the number of emails sent matches the given number.
    #
    #   def test_emails
    #     assert_emails 0
    #     ContactMailer.welcome.deliver_now
    #     assert_emails 1
    #     ContactMailer.welcome.deliver_now
    #     assert_emails 2
    #   end
    #
    # If a block is passed, that block should cause the specified number of
    # emails to be sent.
    #
    #   def test_emails_again
    #     assert_emails 1 do
    #       ContactMailer.welcome.deliver_now
    #     end
    #
    #     assert_emails 2 do
    #       ContactMailer.welcome.deliver_now
    #       ContactMailer.welcome.deliver_now
    #     end
    #   end
    def assert_emails(number)
      if block_given?
        original_count = ActionMailer::Base.deliveries.size
        yield
        new_count = ActionMailer::Base.deliveries.size
        assert_equal number, new_count - original_count, "#{number} emails expected, but #{new_count - original_count} were sent"
      else
        assert_equal number, ActionMailer::Base.deliveries.size
      end
    end

    # Asserts that no emails have been sent.
    #
    #   def test_emails
    #     assert_no_emails
    #     ContactMailer.welcome.deliver_now
    #     assert_emails 1
    #   end
    #
    # If a block is passed, that block should not cause any emails to be sent.
    #
    #   def test_emails_again
    #     assert_no_emails do
    #       # No emails should be sent from this block
    #     end
    #   end
    #
    # Note: This assertion is simply a shortcut for:
    #
    #   assert_emails 0, &block
    def assert_no_emails(&block)
      assert_emails 0, &block
    end

    # Asserts that the number of emails enqueued for later delivery matches
    # the given number.
    #
    #   def test_emails
    #     assert_enqueued_emails 0
    #     ContactMailer.welcome.deliver_later
    #     assert_enqueued_emails 1
    #     ContactMailer.welcome.deliver_later
    #     assert_enqueued_emails 2
    #   end
    #
    # If a block is passed, that block should cause the specified number of
    # emails to be enqueued.
    #
    #   def test_emails_again
    #     assert_enqueued_emails 1 do
    #       ContactMailer.welcome.deliver_later
    #     end
    #
    #     assert_enqueued_emails 2 do
    #       ContactMailer.welcome.deliver_later
    #       ContactMailer.welcome.deliver_later
    #     end
    #   end
    def assert_enqueued_emails(number, &block)
      assert_enqueued_jobs number, only: [ ActionMailer::DeliveryJob, ActionMailer::Parameterized::DeliveryJob ], &block
    end

    # Asserts that block should cause the specified email
    # to be enqueued.
    #
    #   def test_email_in_block
    #     assert_enqueued_email_with ContactMailer, :welcome do
    #       ContactMailer.welcome.deliver_later
    #     end
    #   end
    #
    # If +args+ is provided as a Hash, a parameterized email is matched.
    #
    #   def test_parameterized_email
    #     assert_enqueued_email_with ContactMailer, :welcome,
    #       args: {email: 'user@example.com} do
    #       ContactMailer.with(email: 'user@example.com').welcome.deliver_later
    #     end
    #   end
    def assert_enqueued_email_with(mailer, method, args: nil, queue: "mailers", &block)
      if args.is_a? Hash
        job = ActionMailer::Parameterized::DeliveryJob
        args = [mailer.to_s, method.to_s, "deliver_now", args]
      else
        job = ActionMailer::DeliveryJob
        args = [mailer.to_s, method.to_s, "deliver_now", *args]
      end

      assert_enqueued_with(job: job, args: args, queue: queue, &block)
    end

    # Asserts that no emails are enqueued for later delivery.
    #
    #   def test_no_emails
    #     assert_no_enqueued_emails
    #     ContactMailer.welcome.deliver_later
    #     assert_enqueued_emails 1
    #   end
    #
    # If a block is provided, it should not cause any emails to be enqueued.
    #
    #   def test_no_emails
    #     assert_no_enqueued_emails do
    #       # No emails should be enqueued from this block
    #     end
    #   end
    def assert_no_enqueued_emails(&block)
      assert_no_enqueued_jobs only: [ ActionMailer::DeliveryJob, ActionMailer::Parameterized::DeliveryJob ], &block
    end
  end
end
