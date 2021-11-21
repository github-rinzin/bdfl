class PostDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      title: {source: "Post.title", cond: :like}
      des: { source: "Post.des"}
    }
  end

  def data
    records.map do |record|
      {
        # example:
        # id: record.id,
        # name: record.name
        title: record.title
        des: record.des
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    Post.all
  end

end
