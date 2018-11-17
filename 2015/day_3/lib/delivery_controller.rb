require_relative 'present_deliverer'

class DeliveryController
  attr_reader :deliverer_klass, :deliverers

  def initialize(deliverer_count: 1, deliverer_klass: PresentDeliverer)
    @deliverer_klass = deliverer_klass
    @deliverers = []
    create_deliverers(deliverer_count)
  end

  def process_deliveries(directions)
    direction_arrays = split_input(deliverers.length, directions)
    direction_arrays.each_with_index{ |array, i| instruct_deliverer(deliverers[i], array) }
    create_delivery_report
  end

  private
  def create_deliverers(deliverer_count)
    deliverer_count.times { deliverers.push(deliverer_klass.new) }
  end

  def split_input(groups, input)
    group_number = 0
    all_groups = create_groups_array(groups)

    input.split('').each do |direction|
      all_groups[group_number].push(direction)
      group_number += 1
      group_number = group_number >= groups ? 0 : group_number
    end
    all_groups
  end

  def create_groups_array(groups)
    all_groups = []
    groups.times{ all_groups.push([]) }
    all_groups
  end

  def instruct_deliverer(deliverer, input)
    input.map{ |direction| deliverer.move(direction) }
  end

  def create_delivery_report
    all_deliveries = deliverers.each_with_object([]){ |deliverer, arr| arr.concat(deliverer.visited) }
    report_delivery_count(all_deliveries)
  end

  def report_delivery_count(deliveries)
    deliveries.uniq.count
  end
end
