BEGIN;
create extension country;
SET max_parallel_workers_per_gather=4;
SET force_parallel_mode=on;

CREATE TABLE parallel_test(i int, c country) WITH (parallel_workers = 4);
INSERT INTO parallel_test (i, c)
SELECT i, c.country
FROM generate_series(1,1e6) i,
LATERAL (SELECT CASE WHEN i % 3 = 0 THEN 'US'::country
                     WHEN i % 3 = 1 THEN 'DE'::country
                     WHEN i % 3 = 2 THEN 'CA'::country
         END as country) c;

EXPLAIN (costs off, verbose)
SELECT COUNT(*) FROM parallel_test WHERE  c = 'us';;

EXPLAIN (costs off, verbose)
SELECT c, COUNT(*) FROM parallel_test GROUP BY 1;
ROLLBACK;
