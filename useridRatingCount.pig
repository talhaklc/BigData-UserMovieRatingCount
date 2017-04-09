DATA = LOAD '/user/ratings/ratings.csv' USING PigStorage(',') AS
(
 userid: int,
 movieid: int,
 rating: float,
 times: long
);
DATA_GROUPED = GROUP DATA BY userid;
RESULT = FOREACH DATA_GROUPED  {
        GENERATE 
	 group ,
          COUNT(DATA);
}
 
 
DUMP RESULT;