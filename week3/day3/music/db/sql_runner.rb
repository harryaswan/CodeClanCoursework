require('pg')
class SQLRun

    def self.exec(sql)
        result = nil
        begin
            db = PG.connect({dbname: 'music_library', host: 'localhost'})
            result = db.exec(sql)
        ensure
            db.close()
        end

        return result

    end

end
