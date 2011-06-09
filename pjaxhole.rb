require 'sinatra'

configure do
  set :annoyance_hash, YAML.load_file('data/annoyances.yml')
end


get '/' do
  erb :index
end

get '/:annoyance' do
  @annoyance = settings.annoyance_hash[params[:annoyance]] || {}
  @annoyance['name'] = params[:annoyance]
  @title = @annoyance['name']
  erb :index, :layout => !pjax?  # PJAXHERE
end


helpers do

  def random_annoyance(options={})
    pile_of_annoy = settings.annoyance_hash.dup
    pile_of_annoy.delete(options[:excluded_annoyance]['name']) if options[:excluded_annoyance]
    annoyance = pile_of_annoy.to_a[rand(pile_of_annoy.size)]
    {'name' => annoyance[0]}.merge(annoyance[1])
  end

	def html_for(annoyance)
	  case
    when youtube?(annoyance)
      embed_target = "http://www.youtube.com/embed/#{annoyance['target'].match(/\?v=(.+)/)[1]}"
      "<iframe width='425' height='349' src='#{embed_target}?autoplay=1' frameborder='0' allowfullscreen></iframe>"
    when image?(annoyance)
      "<img src='#{annoyance['target']}' />"
    else
      "Not annoying enough"
    end
	end
	
	def pretty_name_for(annoyance)
	  annoyance['name'].gsub('-', ' ').capitalize
	end
	 
	def youtube?(annoyance)
	  annoyance['target'] =~ /youtube\.com/
	end
	
	def image?(annoyance)
	  annoyance['target'] =~ /\.(jpg|gif|jpeg|png)/
	end
	
	# PJAXHERE
	def pjax?
    env['HTTP_X_PJAX']
  end
  
  INTROS = %w{
    Push\ it,\ make\ it
    I\ want
    Gimme\ more
    Hunk\ a\ hunk\ a
    Suck\ it\ down,
    Drop\ kick\ and
    Shake,\ rattle\ and
    Shut\ up,\ Donnie,\ and
    I\ love\ the\ smell\ of
    Say\ hello\ to\ my\ little
    Heeeeere’s
    To\ infinity...and
    Houston,\ we\ have\ a
    Go\ ahead,\ make\ my
    I\ feel\ the\ need,\ the\ need\ for
    You're\ gonna\ need\ a\ bigger
    Soylent\ Green\ is
    Here's\ lookin'\ at\ you,
    They\ may\ take\ our\ lives,\ but\ they’ll\ never\ take...our
    There's\ no\ place\ like
    I'm\ the\ king\ of\ the
    That'll\ do
  }
  def random_intro
    INTROS[rand(INTROS.size)]
  end

end