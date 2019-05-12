function [w,b,dJdw,dJdb,J] = optimalizacia(X,Y,w,b,alfa,dJdw,dJdb)

    [J,dJdw,dJdb]=naklady(X,Y,w,b);
    w=w-alfa*dJdw;
    b=b-alfa*dJdb;
        
end