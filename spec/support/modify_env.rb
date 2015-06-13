require "climate_control"

module ModifyEnv
  def with_modified_env(options, &block)
    ClimateControl.modify(options, &block)
  end
end
