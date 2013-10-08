require "rspec/core/formatters/base_text_formatter"

class CustomFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def initialize(output)
    super(output)
  end


  
       REPORT_HEADER = <<-EOF
<div class="rspec-report">

<div id="rspec-header">
  <div id="label">
    <h1>Unipei Test Report</h1>
  </div>

  <div id="display-filters">
    <input id="passed_checkbox"  name="passed_checkbox"  type="checkbox" checked="checked" onchange="apply_filters()" value="1" /> <label for="passed_checkbox">Passed</label>
    <input id="failed_checkbox"  name="failed_checkbox"  type="checkbox" checked="checked" onchange="apply_filters()" value="2" /> <label for="failed_checkbox">Failed</label>
    <input id="pending_checkbox" name="pending_checkbox" type="checkbox" checked="checked" onchange="apply_filters()" value="3" /> <label for="pending_checkbox">Pending</label>
  </div>

  <div id="summary">
    <p id="totals">&#160;</p>
    <p id="duration">&#160;</p>
  </div>
</div>


<div class="results">
EOF

end