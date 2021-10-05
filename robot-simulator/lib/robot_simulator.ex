defmodule RobotSimulator do
  @moduledoc false
  defguard is_direction(direction) when direction in [:north, :east, :south, :west]

  defguard is_position(position)
           when tuple_size(position) == 2 and is_integer(elem(position, 0)) and
                  is_integer(elem(position, 1))

  defp valid_instruction?("R"), do: true
  defp valid_instruction?("L"), do: true
  defp valid_instruction?("A"), do: true
  defp valid_instruction?(_), do: false

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, position) when is_direction(direction) and is_position(position) do
    {direction, position}
  end

  def create(direction, _) when not is_direction(direction), do: {:error, "invalid direction"}
  ####
  # def create(_, position) when not is_position(position), do: { :error, "invalid position" }
  # causes "no function clause matching in RobotSimulator.create/2"
  # with create(:north, "invalid")
  def create(_, _), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, ""), do: robot
  def simulate({:north, position}, "L"), do: {:west, position}
  def simulate({:north, position}, "R"), do: {:east, position}
  def simulate({:east, position}, "L"), do: {:north, position}
  def simulate({:east, position}, "R"), do: {:south, position}
  def simulate({:south, position}, "L"), do: {:east, position}
  def simulate({:south, position}, "R"), do: {:west, position}
  def simulate({:west, position}, "L"), do: {:south, position}
  def simulate({:west, position}, "R"), do: {:north, position}
  def simulate({:north, {x, y}}, "A"), do: {:north, {x, y + 1}}
  def simulate({:east, {x, y}}, "A"), do: {:east, {x + 1, y}}
  def simulate({:south, {x, y}}, "A"), do: {:south, {x, y - 1}}
  def simulate({:west, {x, y}}, "A"), do: {:west, {x - 1, y}}

  def simulate(robot, instructions) do
    {instruction, rest} = String.next_grapheme(instructions)

    if valid_instruction?(instruction) do
      simulate(simulate(robot, instruction), rest)
    else
      {:error, "invalid instruction"}
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction({direction, _}), do: direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position({_, position}), do: position
end
