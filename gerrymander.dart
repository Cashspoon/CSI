import 'dart:math';

class Grid
{
    List<List<int>> grid = [];
    int gridSize = 0;

    Grid(int size)
    {
        gridSize = size;
        for (int i = size; i > 0; i--)
        {
            List<int> row = [];
            for (int i = size; i > 0; i--)
            {
                row.add(-1);
            }
            grid.add(row);
        }
    }

    void GenerateMap()
    {

    }

    void GenerateRiver()
    {
        int cell = Random().nextInt(gridSize);
        grid[0][cell] = 0;

        for (int i = 1; i < gridSize; i++)
        {
            int direction = Random().nextInt(3) - 1;
            cell += direction;

            if (cell < 0)
            {
                cell = 0;
            }
            else if (cell >= gridSize)
            {
                cell = gridSize - 1;
            }

            grid[i][cell] = 0;
        }
    }

    void GenerateDistricts()
    {
      int districtAmount = gridSize;

      List<(int,int)> visitedCells = [];
      List<(int,int)> cellsToVisit = [];

      for (int districtNum = 1; districtNum < districtAmount + 1; districtNum++)
      {
        //Find first empty (-1) cell
        for (int j = 0; j < grid.length; j++)
        {
            for (int k = 0; k < grid[j].length; k++)
            {
                if (grid[j][k] == -1)
                {
                    cellsToVisit.add((j,k));
                    break;
                }
            }

            if (!cellsToVisit.isEmpty)
            {
                break;
            }
        }

        int fill = gridSize;
        while (!cellsToVisit.isEmpty && fill > 0)
        {
            print("Visiting new cell from $cellsToVisit");

          int y = cellsToVisit[0].$1;
          int x = cellsToVisit[0].$2;

          if (grid[y][x] == -1)
          {
            grid[y][x] = districtNum;
          }

          print("Visiting cell ${cellsToVisit[0]}");
          if (!cellsToVisit.contains( (y, x + 1) ) && x + 1 < gridSize && grid[y][x + 1] < 1)
          {
            print("Adding cell to the right ($y,${x + 1})");
            cellsToVisit.add((y,x + 1));
          }
          if (!cellsToVisit.contains( (y + 1, x) ) && y + 1 < gridSize && grid[y + 1][x] < 1 )
          {
            print("Adding cell bellow (${y + 1},$x)");
            cellsToVisit.add((y + 1,x));
          }
          if (!cellsToVisit.contains( (y, x - 1) ) && x - 1 >= 0 && grid[y][x - 1] < 1 )
          {
            print("Adding cell to the left ($y,${x - 1})");
            cellsToVisit.add((y,x - 1));
          }

          visitedCells.add(cellsToVisit[0]);
          cellsToVisit.removeAt(0);
          fill--;
        }
        print("District finished filling.");
        cellsToVisit.clear();
      }
    }

    @override
    String toString()
    {
        String msg = '';

        for (List<int> numberList in grid)
        {
            msg += "$numberList\n";
        }

        return msg;
    }
}

void main()
{
    Grid myGrid = Grid(10);
    myGrid.GenerateRiver();
    print(myGrid);
    myGrid.GenerateDistricts();
    print(myGrid);
}