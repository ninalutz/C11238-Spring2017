// Maze generation

/**
 * Defines the interface for a class displaying a cell.
 */
public interface CellDisplayer
{
  void setWallDisplayer(WallDisplayer wd);
  void display(Cell c);
}
