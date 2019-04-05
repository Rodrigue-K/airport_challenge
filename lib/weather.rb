class Weather
  def stormy?
    Kernel.rand(1..10) > 5
  end
end
