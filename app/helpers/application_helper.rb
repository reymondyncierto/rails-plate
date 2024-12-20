module ApplicationHelper
  def link_to_add_fields(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields #{args[:class]}", data: { id: id, fields: fields.gsub("\n", "") })
  end

  def time_slots_for_day(day)
    @time_slots.select { |time_slot| time_slot.start_time.to_date == day }
  end
end
