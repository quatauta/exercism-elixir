defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    cond do
      !valid_direction?(direction) -> {:error, "invalid direction"}
      !valid_position?(position) -> {:error, "invalid position"}
      true -> { direction, position }
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, ""), do: robot
  def simulate({:north, position}, "L"), do: {:west,  position}
  def simulate({:north, position}, "R"), do: {:east,  position}
  def simulate({:east,  position}, "L"), do: {:north, position}
  def simulate({:east,  position}, "R"), do: {:south, position}
  def simulate({:south, position}, "L"), do: {:east,  position}
  def simulate({:south, position}, "R"), do: {:west,  position}
  def simulate({:west,  position}, "L"), do: {:south, position}
  def simulate({:west,  position}, "R"), do: {:north, position}
  def simulate({:north, {x, y}}, "A"), do: {:north, {x, y + 1}}
  def simulate({:east,  {x, y}}, "A"), do: {:east,  {x + 1, y}}
  def simulate({:south, {x, y}}, "A"), do: {:south, {x, y - 1}}
  def simulate({:west,  {x, y}}, "A"), do: {:west,  {x - 1, y}}
  def simulate(robot, instructions) do
    {instruction, rest} = String.next_grapheme(instructions)

    cond do
      !valid_instruction?(instruction) -> {:error, "invalid instruction"}
      true -> simulate(simulate(robot, instruction), rest)
    end
  end

  defp valid_instruction?("R"), do: true
  defp valid_instruction?("L"), do: true
  defp valid_instruction?("A"), do: true
  defp valid_instruction?(_), do: false

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    { direction, _ } = robot
    direction
  end

  defp valid_direction?(:north), do: true
  defp valid_direction?(:east),  do: true
  defp valid_direction?(:south), do: true
  defp valid_direction?(:west),  do: true
  defp valid_direction?(_),      do: false

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    { _, position } = robot
    position
  end

  defp valid_position?({x, y}) when is_integer(x) and is_integer(y), do: true
  defp valid_position?(_), do: false
end
