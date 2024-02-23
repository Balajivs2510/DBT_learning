{{config(materialized='table',schema= env_var('dbt_trfschema','TRANSFORMING'))}}
with employee as (
    select
    EMPID,
    LAST_NAME,
    FIRST_NAME,
    TITLE, HIRE_DATE, OFFICE,
    EXTENSION,
    REPORTS_TO,
    YEAR_SALARY
    from {{ ref('stg_employees') }}
),
employee_1 as (
select e.EMPID,
    e.LAST_NAME,
    e.FIRST_NAME,
    e.TITLE, e.HIRE_DATE, e.OFFICE,
    se.LAST_NAME||' '||se.FIRST_NAME as reports_to,
    e.YEAR_SALARY
    from
    employee e join {{ ref('stg_employees') }}  se on e.empid = se.empid
),
final as (
    select
    e.EMPID,
    e.LAST_NAME,
    e.FIRST_NAME,
    e.TITLE,
    e.HIRE_DATE,
     e.OFFICE,
      e.REPORTS_TO, e.YEAR_SALARY,
      s.OFFICEADDRESS
      from employee_1 e
      inner join
      {{ ref('stg_offices') }} s on e.office = s.OFFICE
)
select * from final