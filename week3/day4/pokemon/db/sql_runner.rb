require( 'pg' )
class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect({ dbname: 'pokemon', host: 'localhost' })
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end

  def self.get(col, table, wcol=false, wval=false)
      sql = "SELECT #{col} FROM #{table}"
      if wcol && wval
          sql << " WHERE #{wcol} = #{wval};"
      else
          sql << ";"
      end
      return SqlRunner.run(sql)
  end

end
