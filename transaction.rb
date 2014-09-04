class Transaction

  def initialize(each_trans)
    @each_trans = each_trans
  end

  def deposit?
    if @each_trans['Amount'].to_i > 0
      'DEPOSIT'
    else
      'WITHDRAWAL'
    end
  end

  def summary
    "$#{sprintf('%.2f',@each_trans['Amount'])} #{deposit?} #{@each_trans['Date']} - #{@each_trans['Description']}"
  end
end
