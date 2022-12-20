void main()

{

   calcAddress(1200,0,0,2,2,1);

   calcAddress(100,1,1,2,2,2);

   calcAddress(100,2,3,4,5,4);

   calcAddress(100,-1,-1,1,2,8);

}

 

void calcAddress(int base,int rowlb, int collb, int rowub, int colub, int elementsize)

{

    int a,b,c,temp;

    c = colub - collb + 1;

    printf("For array a[%d:%d,%d:%d] with element size %d:",rowlb,rowub,collb,colub,elementsize);

    a = rowlb;

    while(a<= rowub)

    {

        b = collb;

        while(b<=colub)

        {

            printf("\na[%d %d] address=",a,b);

            temp = base-(((rowlb*c)+collb)*elementsize)+(((a*c)+b)*elementsize);

            printf("%d\n",temp);

            b++;

        }

        a++;

    }

    printf("\n");

}