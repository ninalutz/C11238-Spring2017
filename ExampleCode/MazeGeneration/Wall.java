// Maze generation

/** A generic simple wall of the maze. */
public class Wall
{
  // An enum is a bit overkill here...
  public static final int TOP = 1;
  public static final int LEFT = 2;
  /** A wall is either a top wall or a left wall. */
  private int kind;
  /** State of wall. */
  private boolean bIsUp = true;
  /** Hard wall? If so, not to bring down in normal operations. */
  private boolean bIsHard;

  public Wall(int kindOfWall)
  {
    assert kindOfWall == TOP || kindOfWall == LEFT;
    kind = kindOfWall;
  }

  public boolean isUp()
  {
    return bIsUp;
  }
  public void bringDown()
  {
    bIsUp = false;
  }

  public int getKind()
  {
    return kind;
  }
  public boolean isTop()
  {
    return kind == TOP;
  }

  public boolean isHard()
  {
    return bIsHard;
  }
  public void setAsHard()
  {
    bIsHard = true;
  }

  public boolean isUpAndSoft()
  {
    return !bIsHard && bIsUp;
  }

  @Override public String toString()
  {
    return "Wall: " + (kind == TOP ? "TOP" : "LEFT") + (bIsUp ? " is up" : " is down");
  }
}

