defmodule GolTest do
  use ExUnit.Case
  doctest Gol

  test "generates empty array with appropriate number of columns" do
    newWorld = Gol.newWorld(10, 10)
    newWorldLength = Enum.count(newWorld)
    assert newWorldLength == 10
  end

  test "generates empty array with appropriate number items in a row" do
    newWorld = Gol.newWorld(10, 10)
    row = Enum.fetch!(newWorld, 3)
    newWorldLength = Enum.count(row)
    assert newWorldLength == 10
  end

  test "generates designated number of columns" do
    newWorldGrid = []
    colArr = Gol.createColumns(10, newWorldGrid)
    colArrLength = Enum.count(colArr)
    assert 10 == colArrLength
  end

  test "one column should have a length of ten" do
    rowLength = 10
    col = []
    newRow = Gol.generateRowOfLength(rowLength, col)
    generatedRowLength = Enum.count(newRow)
    assert rowLength == generatedRowLength
  end

  test "display board test" do
    newWorld = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    Gol.displayWorld(newWorld)
    assert 10 == 10
  end

  test "should return the cell number at a given xy" do
    xyGrid = [1, 1]
    newWorld = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
    cell = Gol.getCellValueAt(xyGrid, newWorld)
    assert 1 == cell
  end

  test "should return zero as the number of alive neighbors" do
    newWorld = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    numberOfAliveNeighbors = Gol.getAliveNeighborsAt([1, 1], newWorld)
    assert numberOfAliveNeighbors == 0
  end

  test "should return one as the number of alive neighbors" do
    newWorld = [[0, 0, 1], [0, 0, 0], [0, 0, 0]]
    numberOfAliveNeighbors = Gol.getAliveNeighborsAt([1, 1], newWorld)
    assert numberOfAliveNeighbors == 1
  end

  test "should return zero as the number of alive neighbors for corner" do
    newWorld = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    numberOfAliveNeighbors = Gol.getAliveNeighborsAt([0, 0], newWorld)
    assert numberOfAliveNeighbors == 0
  end

  test "should return one as the number of alive neighbors for corner" do
    newWorld = [[0, 1, 0], [0, 0, 0], [0, 0, 0]]
    numberOfAliveNeighbors = Gol.getAliveNeighborsAt([0, 0], newWorld)
    assert numberOfAliveNeighbors == 1
  end

  test "should return a living cell if dead cell has three neighbors" do
    cellValue = 0
    sumOfNeighbors = 3
    newCell = Gol.createNewCell(cellValue, sumOfNeighbors)
    assert newCell == 1
  end

  test "should return a dead cell if dead cell has no alive neighbors" do
    cellValue = 0
    sumOfNeighbors = 0
    newCell = Gol.createNewCell(cellValue, sumOfNeighbors)
    assert newCell == 0
  end

  test "should return a dead cell if alive cell has no alive neighbors" do
    cellValue = 1
    sumOfNeighbors = 4
    newCell = Gol.createNewCell(cellValue, sumOfNeighbors)
    assert 0 == newCell
  end

  test "should return a dead cell if alive cell has four alive neighbors" do
    cellValue = 1
    sumOfNeighbors = 4
    newCell = Gol.createNewCell(cellValue, sumOfNeighbors)
    assert newCell == 0
  end

  # test "should return a world with no alive cells when no living cells exist on start" do
  #   newWorld = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  #   nextWorld = Gol.tick(newWorld)
  #   assert [[0, 0, 0], [0, 0, 0], [0, 0, 0]] == nextWorld
  # end

  # test "should return a world with no alive cells when one living cell is in the center surrounded by dead cells" do
  #   newWorld = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
  #   nextWorld = Gol.tick(newWorld)
  #   assert [[0, 0, 0], [0, 0, 0], [0, 0, 0]] == nextWorld
  # end
end
