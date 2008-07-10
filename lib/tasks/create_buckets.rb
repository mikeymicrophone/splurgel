require 'aws/s3'

AWS::S3::Base.establish_connection!(:access_key_id => '1QNSZZFD90243N9WS1G2', :secret_access_key => 'vEpa2oOL1GlDB/cHQ/L94QikIcGilanAVCuzdj6X')

Bucket.create('splurgel_development')
Bucket.create('splurgel_test')
Bucket.create('splurgel')

