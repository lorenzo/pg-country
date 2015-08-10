BEGIN;
-- os_name_op should implement gt;
-- ./spec/country_op_spec.rb:8;
CREATE EXTENSION country;
SELECT 'uk'::country > 'de'::country;
SELECT 'uk'::country >= 'de'::country;
SELECT NOT('uk'::country < 'de'::country);
SELECT NOT('uk'::country <= 'de'::country);
ROLLBACK;
BEGIN;
-- os_name_op should implement lt;
-- ./spec/country_op_spec.rb:15;
CREATE EXTENSION country;
SELECT 'uk'::country > 'de'::country;
SELECT 'uk'::country >= 'de'::country;
SELECT NOT('uk'::country < 'de'::country);
SELECT NOT('uk'::country <= 'de'::country);
ROLLBACK;
BEGIN;
-- os_name_op should implement eq;
-- ./spec/country_op_spec.rb:22;
CREATE EXTENSION country;
SELECT NOT('de'::country = 'uk'::country);
SELECT 'uk'::country = 'uk'::country;
ROLLBACK;
BEGIN;
-- os_name_op should implement neq;
-- ./spec/country_op_spec.rb:27;
CREATE EXTENSION country;
SELECT 'de'::country != 'uk'::country;
SELECT NOT('uk'::country != 'uk'::country);
ROLLBACK;
