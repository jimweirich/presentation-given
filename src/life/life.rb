class Cell
  def self.live
    new(true)
  end

  def self.dead
    new(false)
  end

  def initialize(alive)
    @live = alive
  end

  def adopt(neighbors)
    @neighbors = neighbors
  end

  def alive?
    @live
  end

  def dead?
    ! alive?
  end

  def detect
    @next = neighbor_count == 3 || (alive? && neighbor_count == 2)
  end

  def update
    @live = @next
  end

  def to_s
    "."
  end

  # @private
  def alive=(alive)
    @alive = alive
  end

  private

  def neighbor_count
    @neighbors.inject(0) { |s,n| s + (n.alive? ? 1 : 0) }
  end

end
