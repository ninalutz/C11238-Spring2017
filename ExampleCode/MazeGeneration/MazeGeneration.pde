/**
Maze generation.
Trying to have a robust, multi-algorithm data structure, a flexible way to display the maze,
and pluggable algorithms.

by Philippe Lhoste <PhiLho(a)GMX.net> http://Phi.Lho.free.fr & http://PhiLho.deviantART.com
*/
/* File/Project history:
 1.00.000 -- 2010/12/11 (PL) -- Creation.
*/
/* Copyright notice: For details, see the following file:
http://Phi.Lho.free.fr/softwares/PhiLhoSoft/PhiLhoSoftLicense.txt
This program is distributed under the zlib/libpng license.
Copyright (c) 2010 Philippe Lhoste / PhiLhoSoft
*/
// Maze Generation

final int MAZE_WIDTH = 32;
final int MAZE_HEIGHT = 24;
final int CELL_SIZE = 30;
final int WALL_WIDTH = 7;

boolean bDebug = false;

GraphicalMaze maze;
CarveAlgorithm carver;

void setup()
{
  size(1100, 800);
  smooth();
//  frameRate(15);

  maze = new GraphicalMaze(MAZE_WIDTH, MAZE_HEIGHT);
  maze.setCellSize(CELL_SIZE);
  maze.setWallThickness(WALL_WIDTH);
  if (bDebug)
  {
    maze.setCellDisplayer(new ColoredCellDrawer(this, maze));
    maze.setWallDisplayer(new ColoredWallDrawer(this, maze));
  }
  else
  {
    maze.setCellDisplayer(new EmptyCellDrawer(this, maze));
    maze.setWallDisplayer(new SimpleWallDrawer(this, maze));
  }
  carver = new AlgoRecursiveBacktracker(maze.getMaze());
}

void draw()
{
  background(255);
  maze.display();
  if (!carver.isFinished())
  {
    carver.carveMaze();
    if (carver.isFinished())
    {
      println("Done!");
      maze.getMaze().carveEntries();
    }
  }
}

