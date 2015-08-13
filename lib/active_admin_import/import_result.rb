module ActiveAdminImport
  class ImportResult
    attr_reader :failed, :total

    def initialize
      @failed = []
      @total = 0
    end

    def add(result, qty)
       @failed += result.failed_instances
       @total+=qty
    end

    def imported_qty
      total - failed.count
    end

    def has_imported?
      imported_qty > 0
    end

    def has_failed?
      @failed.any?
    end

    def empty?
      total == 0
    end

    def failed_message
      failed.map.with_index{|record, i| "##{i+1} - #{record.errors.full_messages.join(', ')}" }.join("\n")
    end

  end
end
