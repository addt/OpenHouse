# Helper functions relating to time formatting
module TimeHelper
    def range_to_ampm(range)
        start_hour = range[0..1].to_i
        end_hour = range[6..7].to_i
        (((start_hour-1)%12)+1).to_s + range[2..4] + ((start_hour%24)<12?' a.m. - ':' p.m. - ') + (((end_hour-1)%12)+1).to_s + range[8..10] + ((end_hour%24)<12?' a.m.':' p.m.')
    end
end
