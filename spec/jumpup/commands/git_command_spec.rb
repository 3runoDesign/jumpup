require 'spec_helper'

RSpec.describe Jumpup::GitCommand do
  include_examples 'capture stdout'

  context '.store_last_commit_hash' do
    it 'stores the last commit GitCommand.stored_commit_hash' do
      subject.reset_commit_hash!

      expect {
        subject.store_last_commit_hash
      }.to change(subject, :stored_commit_hash).from('')
    end
  end

  context '.check_last_commit_change' do
    it 'halts if last commit changes' do
      subject.store_last_commit_hash
      allow(subject).to receive(:last_commit_hash).and_return('new_hash')

      expect {
        subject.check_last_commit_change
      }.to raise_exception(SystemExit)
    end

    it 'goes on if last commit is the same' do
      subject.store_last_commit_hash

      expect {
        subject.check_last_commit_change
      }.to_not raise_exception
    end
  end

  context '.reset_commit_hash!' do
    it 'change commit hash to empty string' do
      subject.store_last_commit_hash
      expect {
        subject.reset_commit_hash!
      }.to change(subject, :stored_commit_hash).to('')
    end
  end
end

