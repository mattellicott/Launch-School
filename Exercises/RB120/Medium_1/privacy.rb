class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def status
    switch
  end

  private

  attr_writer :switch

  def switch
    @switch
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

switch = Machine.new
