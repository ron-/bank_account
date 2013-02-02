require_relative "spec_helper"
require_relative "../bank" # ../ goes back to previous directory

describe Bank do
  let(:bank) {Bank.new('TD Bank')}


  describe ".new" do
    it "creates a Bank object" do
      expect(bank).to_not eq nil
    end
    it "has no accounts" do
      expect(bank.accounts.count).to eq 0
    end
  end

  describe "#name" do # '#name' is an instance method
    it "has a name" do
      expect(bank.name).to eq 'TD Bank'
    end
  end

  describe "#create_account" do
    it "create an account" do
      bank.create_account('Bob', 200.00)
      expect(bank.accounts['Bob']).to eq 200
    end
  end

  describe "#deposit " do
    it "deposits money from client into account" do
      bank.create_account('Bob', 200)
      bank.deposit('Bob', 300)
      expect(bank.accounts['Bob']).to eq 500
    end
  end
  describe '#balance' do
    it 'returns the balance for the client' do
      bank.create_account('Bob', 200)
      expect(bank.balance('Bob')).to eq 200
    end
  end
  describe '#withdraw' do
    it 'subtracts money from the account by the client' do
      bank.create_account('Bob', 200)
      bank.withdraw('Bob', 50)
      expect(bank.balance('Bob')).to eq 150
    end
    it 'ignores request for withdraw > account balance' do
      bank.create_account('Bob', 200)
      bank.withdraw('Bob', 5000)
      expect(bank.balance('Bob')).to eq 200
    end
  end

end
