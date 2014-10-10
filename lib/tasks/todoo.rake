task delete_items: :environment do
  Todoo.where("created_at <= ?", Time.now - 7.days).destroy_all
end