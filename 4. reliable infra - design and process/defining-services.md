## Defining Services

1. List Features - Features can be considered as qualitative requirements. You can express them in the form of user stories

2. User personas

3. User stories - It is a short description of a feature written from the user’s point of view.

User stories Follow the INVEST criteria
- Independent
- Negotiable
- Valuable
- Estimatable
- Small 
- Testable

4. KPIs

Quantitative requirements are things that are measurable Given the constraints (Time, Finance, People), what can be achieved? (e.g How many users, how much data, rewards and risks?)

KPIs are metrics that can be used to measure success

**Business KPIs**
- ROI
- Earnings before interest and taxes
- Customer churn
- Emplyeee turnover

**Software KPIs**
- Page views
- User registrations
- Clickthroughs

**KPIS != Goals or objective**. KPIs are simply metrics that check whether your are on track to meet your goal.
Define goals for each KPI or what success looks like and readjust based on metric.

For KPIs to be effective, they must be SMART
- Specific
- Measurable
- Achievable
- Relevant
- Time-bound

5. SLIs SLOs, SLAs

**An SLI** is a quantitative measure of some aspect of the level of service being provided. Examples: Throuhput, Latency, Availability, Error rate

SLIs must be timebound and measurable
- HTTP GET requests respond within 400MS aggregated per minute
- Percentage of successful requests over all requests aggregated per minute

**An SLO** is the agreed-upon target for a measurement (or SLI) or range of values you want your service to achieve within a given duration. Example: 99% avaialbility per year

- Avoid ambitious SLOs, start with relatively easy ones and tighten them as you discover more about the system
- Avoid too many. Have enough SLOs that cover what users care about
- Good SLOs reflect what users of the system care about

**An SLA** is an agreement between a service provider and a consumer. It defines the responsibilities for delivering a service. It is a more restricted version of an SLO, we want to define SLAs that provide extra room compared to the SLO.

- Penalties apply if SLAs are not met
- Should have threshold lower than your SLO
- Should build a Buffer between SLO and SLA such that even if SLO is not met, SLA is not broken
- All services need an SLOs but not every service need to have SLAs
