require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'dfjf1fo20ep249',
        host: 'ec2-54-217-245-9.eu-west-1.compute.amazonaws.com',
        port: 5432,
        user: 'pszluyhnuippfs',
        password: '3927ddbdb4da372fef510e3529cbb27ca23099ed6bf329054f9195b9c6ac1bb5'})
        db.prepare("query", sql)
        result = db.exec_prepared( "query", values )
      ensure
        db.close() if db != nil
      end
      return result
    end

  end
