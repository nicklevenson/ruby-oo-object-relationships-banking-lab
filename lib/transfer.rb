class Transfer
  attr_accessor :sender, :receiver, :status, :transfer
  def initialize(sender, receiver, transfer)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @transfer = transfer
  end

  def amount
    @transfer
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? && @sender.balance >= @transfer && @status == 'pending'
      @status = "complete"
      @sender.balance -= @transfer
      @receiver.balance += @transfer
    
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction
      @status = "reversed"
      @sender.balance += @transfer
      @receiver.balance -= @transfer
    end
  end

end
