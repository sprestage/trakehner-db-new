
task :load_scraped_json  => :environment do
  records = JSON.parse( File.read( 'app/assets/data/json/horses_from_ATA_site/horses_initial_y.json' ) )
  records.each do | record |
    Horse.create_from_json( record )
  end
end

task :import_stallion_images  => :environment do
  filename = "app/assets/data/json/ata_2013_approved_stallions.json"
  records = JSON.parse( File.read ( filename ) )
  records.each do | r |
    Horse.import_image_from_remote( r, "S" )
  end
end

task :update_stallion_thumbnails => :environment do
  horses = Horse.all()
  horses.each do | horse |
    if horse.image
      horse.image.recreate_versions!
    end
  end
end
