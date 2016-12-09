class User

  def initialize(full_name, address, city, state, zip_code, country, email, user_id, password)
    @full_name = full_name
    @address = address
    @city = city
    @state = state
    @zip_code = zip_code
    @country = country
    @email = email
    @user_id = user_id
    @password = password
  end

  def full_name=(full_name)
    @full_name = full_name
  end

  def address=(address)
    @address = address
  end

  def city=(city)
    @city = city
  end

  def state=(state)
    @state = state
  end

  def zip_code=(zip_code)
    @zip_code = zip_code
  end

  def country=(country)
    @country = country
  end

  def email=(email)
    @email = email
  end

  def user_id=(user_id)
    @user_id = user_id
  end

  def password=(password)
    @password = password
  end

  def full_name
    @full_name
  end

  def address
    @address
  end

  def city
    @city
  end

  def state
    @state
  end

  def zip_code
    @zip_code
  end

  def country
    @country
  end

  def email
    @email
  end

  def user_id
    @user_id
  end

  def password
    @password
  end


end
