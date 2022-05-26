defmodule Gol do
  def newWorld(columns, rows) do
    blankWorld = []
    newWorldOnlyColumns = createColumns(columns, blankWorld)
    newWorldOnlyDead = Enum.map(newWorldOnlyColumns, fn col -> generateRowOfLength(rows, col) end)
  end

  def createColumns(1, array), do: [[] | array]

  def createColumns(num, array) do
    num = num - 1
    array = [[] | array]
    createColumns(num, array)
  end

  def generateRowOfLength(1, col), do: [0 | col]

  def generateRowOfLength(num, col) do
    num = num - 1
    col = [0 | col]
    generateRowOfLength(num, col)
  end

  def displayWorld(world) do
    for row <- world do
      IO.inspect(row)
    end

    IO.puts("\r\n")
  end

  def getRow(x, world) do
    Enum.fetch!(world, x)
  end

  def getCellFromRow(y, row) do
    Enum.fetch!(row, y)
  end

  def getCellValueAt(gridPoint, world) do
    x = Enum.fetch!(gridPoint, 0)
    y = Enum.fetch!(gridPoint, 1)
    row = getRow(x, world)
    cell = getCellFromRow(y, row)
  end

  def getAliveNeighborsAt(xyGridArr, world) do
    sum = 0
    x = Enum.fetch!(xyGridArr, 0)
    y = Enum.fetch!(xyGridArr, 1)
    sum = sum + getCellValueAt([x - 1, y - 1], world)
    sum = sum + getCellValueAt([x, y - 1], world)
    sum = sum + getCellValueAt([x + 1, y - 1], world)
    sum = sum + getCellValueAt([x - 1, y], world)
    sum = sum + getCellValueAt([x + 1, y], world)
    sum = sum + getCellValueAt([x - 1, y + 1], world)
    sum = sum + getCellValueAt([x, y + 1], world)
    sum = sum + getCellValueAt([x + 1, y + 1], world)
  end

  def createNewCell(oldCellValue, sumOfNeighbors) do
    if oldCellValue == 1 do
      if sumOfNeighbors == 2 or sumOfNeighbors == 3 do
        1
      else
        0
      end
    end

    if oldCellValue == 0 do
      if sumOfNeighbors == 3 do
        1
      else
        0
      end
    end
  end

  def tick(oldWorld) do
    Enum.each(0..10, fn (x) ->
      IO.puts("X: #{x}")
    end)
  end



end
