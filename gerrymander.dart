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

    void GenerateDistricts(int range)
    {
        int districtAmount = gridSize - 1;

        //List<(int,int)> visitedCells = [];
        List<(int,int)> cellsToVisit = [];

        for (int i = 1; i < districtAmount + 1; i++)
        {
            for (int i = 0; i < grid.length; i++)
            {
                for (int j = 0; j < grid[i].length; j++)
                {
                    if (grid[i][j] == -1)
                    {
                        cellsToVisit.add((i,j));
                    }
                }
            }

            while (!cellsToVisit.isEmpty)
            {

            }
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
    //Grid myGrid = Grid(10);
}