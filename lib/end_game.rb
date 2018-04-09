# The EndGame module contains the rules for completing a game of
# Connect Four. Winning circumstances include horizontal, vertical
# and diagonal series of four pieces. Module also sensitive to when
# a draw has occured.
module EndGame
  def horizontal_win?(space)
    matches = [space]
    matches = add_straight_matches(space, matches, :left)
    matches = add_straight_matches(space, matches, :right)
    return true if matches.length >= 4
    false
  end

  def verticle_win?(space)
    matches = [space]
    matches = add_straight_matches(space, matches, :up)
    matches = add_straight_matches(space, matches, :down)
    return true if matches.length >= 4
    false
  end

  def diagonal_win?(space)
    diagonal_down_to_up(space) || diagonal_up_to_down(space)
  end

  private

  def diagonal_up_to_down(space)
    matches = [space]
    matches = add_diagonal_matches(space, matches, :up, :left)
    matches = add_diagonal_matches(space, matches, :down, :right)
    return true if matches.length >= 4
    false
  end

  def diagonal_down_to_up(space)
    matches = [space]
    matches = add_diagonal_matches(space, matches, :up, :right)
    matches = add_diagonal_matches(space, matches, :down, :left)
    return true if matches.length >= 4
    false
  end

  def add_diagonal_matches(space, matches_array, direct_one, direct_two)
    next_space = next_diagonal_space(space, direct_one, direct_two)
    loop do
      break if next_space.nil?
      break if next_space.piece != space.piece
      matches_array.append(next_space)
      next_space = next_diagonal_space(next_space, direct_one, direct_two)
    end
    matches_array
  end

  def next_diagonal_space(space, direct_one, direct_two)
    return nil if space.send(direct_one).nil?
    space = space.send(direct_one)
    return nil if space.send(direct_two).nil?
    space = space.send(direct_two)
    space
  end

  def add_straight_matches(space, matches_array, direct)
    next_space = space.send(direct)
    loop do
      break if next_space.nil?
      break if next_space.piece != space.piece
      matches_array.append(next_space)
      next_space = next_space.send(direct)
    end
    matches_array
  end
end
