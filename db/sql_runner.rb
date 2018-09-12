require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'nine_dice', host: DATABASE_URL })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
