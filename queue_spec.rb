require "./queue.rb"

describe My::Queue do

  before do
    @queue = My::Queue.new
  end

  context "after creation" do

    it "is empty" do
      @queue.should be_empty
    end

    it "size is 0" do
      @queue.size.should == 0
    end

  end

  it "throws an UnderflowError if invoked remove on empty queue" do
    expect {@queue.remove}.to raise_error(My::Queue::UnderflowError)
  end

  it "size is 1 after adding an item" do
    @queue.add(1)
    @queue.size.should == 1
  end

  describe "#remove" do

    it "returns x after x was added" do
      x = someX
      @queue.add(x)
      @queue.remove.should == x
    end

    it "returns x after x and y added (fifo)" do
      x = someX
      y = someX
      @queue.add(x)
      @queue.add(y)
      @queue.remove.should == x
    end

    def someX
      rand(123456789)
    end

  end

end