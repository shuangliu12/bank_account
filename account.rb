class Account

  def initialize(account)
    @account = account
  end

  def starting_balance
    "$#{sprintf('%.2f',@account['Balance'])}"
  end

  def current_balance
    total = 0
    all_data = import_csv('bank_data.csv')
    all_data.each do |trans|
      if trans['Account'] == @account['Account']
        total += trans['Amount'].to_i
      end
    end
    "$#{sprintf('%.2f',total)}"
  end

end
