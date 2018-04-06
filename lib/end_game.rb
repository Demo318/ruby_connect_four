# The EndGame module contains the rules for completing a game of
# Connect Four. Winning circumstances include horizontal, vertical
# and diagonal series of four pieces. Module also sensitive to when
# a draw has occured.
module EndGame

  def horizontal_win?(space)
    matches = [space]
    matches = add_left_matches(space, matches)
    matches = add_right_matches(space, matches)
    return true if matches.length >= 4
    false
  end

  def verticle_win?(space)
    matches = [space]
    matches = add_up_matches(space, matches)
    matches = add_down_matches(space, matches)
    return true if matches.length >= 4
    false
  end

  def diagonal_win?(space)
    diagonal_down_to_up(space) || diagonal_up_to_down(space)
  end

  private

  def diagonal_down_to_up(space)
    matches = [space]
    matches = add_up_right_matches(space, matches)
    matches = add_down_left_matches(space, matches)
    return true if matches.length >= 4
    false
  end

  def add_up_right_matches(space, matches_array)
    next_space = next_diagonal_space(space, :up, :right)
    loop do
      break if next_space.nil?
      break if next_space.piece != space.piece
      matches_array.append(next_space)
      next_space = next_diagonal_space(next_space, :up, :right)
    end
    matches_array
  end

  def add_down_left_matches(space, matches_array)
    next_space = next_diagonal_space(space, :down, :left)
    loop do
      break if next_space.nil?
      break if next_space.piece != space.piece
      matches_array.append(next_space)
      next_space = next_diagonal_space(next_space, :down, :left)
    end
    matches_array
  end

  def diagonal_up_to_down(space)
    matches = [space]
    matches = add_up_left_matches(space, matches)
    matches = add_down_right_matches(space, matches)
    return true if matches.length >= 4
    false
  end

  def add_down_right_matches(space, matches_array)
    next_space = next_diagonal_space(space, :down, :right)
    loop do
      break if next_space.nil?
      break if next_space.piece != space.piece
      matches_array.append(next_space)
      next_space = next_diagonal_space(next_space, :down, :right)
    end
    matches_array
  end

  def add_up_left_matches(space, matches_array)
    next_space = next_diagonal_space(space, :up, :left)
    loop do
      break if next_space.nil?
      break if next_space.piece != space.piece
      matches_array.append(next_space)
      next_space = next_diagonal_space(next_space, :up, :left)
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

  def add_down_matches(space, matches_array)
    next_space = space.down
    loop do
      break if next_space.piece != space.piece
      matches_array.append(next_space)
      next_space = next_space.down
    end
    matches_array
  end

  def add_up_matches(space, matches_array)
    next_space = space.up
    loop do
      break if next_space.piece != space.piece
      matches_array.append(next_space)
      next_space = next_space.up
    end
    matches_array
  end

  def add_right_matches(space, matches_array)
    next_space = space.right
    loop do
      break if next_space.piece != space.piece
      matches_array.append(next_space)
      next_space = next_space.right
    end
    matches_array
  end

  def add_left_matches(space, matches_array)
    next_space = space.left
    loop do
      break if next_space.piece != space.piece
      matches_array.unshift(next_space)
      next_space = next_space.left
    end
    matches_array
  end
end