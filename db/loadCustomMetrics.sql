INSERT INTO `quantifiedself_dev`.`metrics`
(`metric_config_id`,
`metricdate`,
`value`,
`created_at`,
`updated_at`)
select 32 as metric_config_id, date as metricdate, pushups as value, current_date as created_at, current_date as updated_at 
from custommetricsflat_tmp;

INSERT INTO `quantifiedself_dev`.`metrics`
(`metric_config_id`,
`metricdate`,
`value`,
`created_at`,
`updated_at`)
select 31 as metric_config_id, date as metricdate, workoutrate as value, current_date as created_at, current_date as updated_at 
from custommetricsflat_tmp;

INSERT INTO `quantifiedself_dev`.`metrics`
(`metric_config_id`,
`metricdate`,
`value`,
`created_at`,
`updated_at`)
select 33 as metric_config_id, date as metricdate, noalcohol as value, current_date as created_at, current_date as updated_at 
from custommetricsflat_tmp;

INSERT INTO `quantifiedself_dev`.`metrics`
(`metric_config_id`,
`metricdate`,
`value`,
`created_at`,
`updated_at`)
select 34 as metric_config_id, date as metricdate, nolatecalories as value, current_date as created_at, current_date as updated_at 
from custommetricsflat_tmp;

INSERT INTO `quantifiedself_dev`.`metrics`
(`metric_config_id`,
`metricdate`,
`value`,
`created_at`,
`updated_at`)
select 35 as metric_config_id, date as metricdate, motivation as value, current_date as created_at, current_date as updated_at 
from custommetricsflat_tmp;

INSERT INTO `quantifiedself_dev`.`metrics`
(`metric_config_id`,
`metricdate`,
`value`,
`created_at`,
`updated_at`)
select 36 as metric_config_id, date as metricdate, workout as value, current_date as created_at, current_date as updated_at 
from custommetricsflat_tmp;

INSERT INTO `quantifiedself_dev`.`metrics`
(`metric_config_id`,
`metricdate`,
`value`,
`created_at`,
`updated_at`)
select 37 as metric_config_id, date as metricdate, nojavahouse as value, current_date as created_at, current_date as updated_at 
from custommetricsflat_tmp;
