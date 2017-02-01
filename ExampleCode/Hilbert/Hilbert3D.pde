int IDX;                                // coord index
float[][] verts;                        // curve-coords  
float[][] SXD, SYD, SZD;                // cube corners (precomputed for each depth)

// corner directions for x, y, z
float[] SX = {-1,-1,-1,-1,+1,+1,+1,+1}; 
float[] SY = {+1,+1,-1,-1,-1,-1,+1,+1}; 
float[] SZ = {-1,+1,+1,-1,-1,+1,+1,-1}; 
 

//Function that renders the hilbert vectors
//Corners A-H, depth d, x, y, z coords

void hilbert3D(float x, float y, float z, int d, int A, int B, int C, int D, int E, int F, int G, int H) {
  if (d-- == 0)  {
    verts[IDX][0] = x;
    verts[IDX][1] = y;
    verts[IDX][2] = z;  
    IDX++;
  } else {
    final float[] sxd = SXD[d], syd = SYD[d], szd = SZD[d];        
    hilbert3D(x + sxd[A], y + syd[A], z + szd[A], d, A, D, E, H, G, F, C, B ); 
    hilbert3D(x + sxd[B], y + syd[B], z + szd[B], d, A, H, G, B, C, F, E, D ); 
    hilbert3D(x + sxd[C], y + syd[C], z + szd[C], d, A, H, G, B, C, F, E, D ); 
    hilbert3D(x + sxd[D], y + syd[D], z + szd[D], d, C, D, A, B, G, H, E, F ); 
    hilbert3D(x + sxd[E], y + syd[E], z + szd[E], d, C, D, A, B, G, H, E, F ); 
    hilbert3D(x + sxd[F], y + syd[F], z + szd[F], d, E, D, C, F, G, B, A, H ); 
    hilbert3D(x + sxd[G], y + syd[G], z + szd[G], d, E, D, C, F, G, B, A, H ); 
    hilbert3D(x + sxd[H], y + syd[H], z + szd[H], d, G, F, C, B, A, D, E, H ); 
  }
}

Vector[] hilbert3D( Vector center,  float side,  int iterations, int v0, int v1, int v2, int v3, int v4, int v5, int v6, int v7  ){
  Vector vec_s[] = {
    new Vector(  center.x - side/2,   center.y + side/2, center.z - side/2  ),
    new Vector(  center.x - side/2,   center.y + side/2, center.z + side/2  ),
    new Vector(  center.x - side/2,   center.y - side/2, center.z + side/2  ),
    new Vector(  center.x - side/2,   center.y - side/2, center.z - side/2  ),
    new Vector(  center.x + side/2,   center.y - side/2, center.z - side/2  ),
    new Vector(  center.x + side/2,   center.y - side/2, center.z + side/2  ),
    new Vector(  center.x + side/2,   center.y + side/2, center.z + side/2  ),
    new Vector(  center.x + side/2,   center.y + side/2, center.z - side/2  )
  };
  
  Vector vec[] = { vec_s[ v0 ], vec_s[ v1 ], vec_s[ v2 ], vec_s[ v3 ], vec_s[ v4 ], vec_s[ v5 ], vec_s[ v6 ], vec_s[ v7 ]};

  if( --iterations >= 0) {
    Vector tmp[] = new Vector[0];
    tmp = (Vector[]) concat( tmp,   hilbert3D ( vec[ 0 ],  side/2,   iterations,   v0, v3, v4, v7, v6, v5, v2, v1  ));
    tmp = (Vector[]) concat( tmp,   hilbert3D ( vec[ 1 ],  side/2,   iterations,   v0, v7, v6, v1, v2, v5, v4, v3  ));
    tmp = (Vector[]) concat( tmp,   hilbert3D ( vec[ 2 ],  side/2,   iterations,   v0, v7, v6, v1, v2, v5, v4, v3  )); 
    tmp = (Vector[]) concat( tmp,   hilbert3D ( vec[ 3 ],  side/2,   iterations,   v2, v3, v0, v1, v6, v7, v4, v5  ));
    tmp = (Vector[]) concat( tmp,   hilbert3D ( vec[ 4 ],  side/2,   iterations,   v2, v3, v0, v1, v6, v7, v4, v5  )); 
    tmp = (Vector[]) concat( tmp,   hilbert3D ( vec[ 5 ],  side/2,   iterations,   v4, v3, v2, v5, v6, v1, v0, v7  ));
    tmp = (Vector[]) concat( tmp,   hilbert3D ( vec[ 6 ],  side/2,   iterations,   v4, v3, v2, v5, v6, v1, v0, v7  ));
    tmp = (Vector[]) concat( tmp,   hilbert3D ( vec[ 7 ],  side/2,   iterations,   v6, v5, v2, v1, v0, v3, v4, v7  ));
    return tmp;
  }
  return vec;
}


class Vector{
  float x, y, z;
  Vector( float x, float y, float  z){
    this.x = x; 
    this.y = y; 
    this.z = z; 
  }
}

