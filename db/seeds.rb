Workflow.create!([
  {id: 1, code: "SIMPLE", name: "Simple Workflow", local_name: "簡單工作流程"},
  {id: 2, code: "RECORD", name: "Record System", local_name: "記錄系統"}
])
Plan.create!([
  {name: "Early Bird Monthly (US$)", amount: 6900, interval: "month", details: {"stripe_id"=>"plan_Gn8IcMWT9KuGVf", "braintree_id"=>""}, trial_period_days: 7, features: nil},
  {name: "Early Bird Annual (US$)", amount: 69900, interval: "year", details: {"stripe_id"=>"plan_Gn8HtJGVP0DiMd", "braintree_id"=>""}, trial_period_days: 0, features: nil}
])