# Quick and dirty Dendroscope labeling script. Accepts a Dendroscope format tree and
# a variety of clustering text files such as BAPS, eBURST and Bron-Kerbosch outputs
# from the Allele Profiler java application
# Copyright and all that shizzle:
# Copyright (C) 2010 Garan Jones
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
class Label
	attr_accessor :lb_id, :lb_st, :lb_baps_cluster, :lb_colour
	def initialize(st, cluster)
		@lb_st = st
		@lb_baps_cluster = cluster
	end	
end

class Cluster
	attr_accessor :cl_id, :cl_sts	
	def initialize(id, st_array)
		@cl_id = id
		@cl_sts = st_array
	end	
end


class Lookup
	attr_accessor :lk_id, :lk_sts
	def initialize(id, st_array)
		@lk_id = id
		@lk_sts = st_array
	end
end

def colour_line(line, node_label, lb)

	if ! lb.nil?
		  
		case lb.lb_baps_cluster.to_i
			when 1
				#bright red bk, black font
				line.sub!(/lb='/, 'lk=255 0 0 lc=0 0 0 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=255 0 0 fg=0 0 0 lb=\'')
			when 2
				#bright green bk, black font
				line.sub!(/lb='/, 'lk=0 255 0 lc=0 0 0 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=0 255 0 fg=0 0 0 lb=\'')
			when 3
				#bright cyan bk, black font
				line.sub!(/lb='/, 'lk=0 255 255 lc=0 0 0 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=0 255 255 fg=0 0 0 lb=\'')
			when 4
				#dark red bk, white font
				line.sub!(/lb='/, 'lk=102 0 0 lc=255 255 255 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=102 0 0 fg=0 0 0 lb=\'')
			when 5
				#dark green bk, white font
				line.sub!(/lb='/, 'lk=0 102 0 lc=255 255 255 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=0 102 0 fg=0 0 0 lb=\'')
			when 6
				#dark blue bk, white font
				line.sub!(/lb='/, 'lk=0 51 204 lc=255 255 255 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=0 51 204 fg=0 0 0 lb=\'')
			when 7
				#dark grey bk, white font
				line.sub!(/lb='/, 'lk=51 51 51 lc=255 255 255 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=51 51 51 fg=0 0 0 lb=\'')
			when 8
				#teal bk, white font
				line.sub!(/lb='/, 'lk=0 102 102 lc=255 255 255 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=0 102 102 fg=0 0 0 lb=\'')
			when 9
				#pink bk, black font
				line.sub!(/lb='/, 'lk=255 51 255 lc=0 0 0 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=255 51 255 fg=0 0 0 lb=\'')
			when 10
				#orange bk, black font
				line.sub!(/lb='/, 'lk=255 153 0 lc=0 0 0 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=255 153 0 fg=0 0 0 lb=\'')
			when 11
				#gold bk, black font
				line.sub!(/lb='/, 'lk=204 204 0 lc=0 0 0 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=204 204 0 fg=0 0 0 lb=\'')
			when 12
				#yellow bk, black font
				line.sub!(/lb='/, 'lk=255 255 0 lc=0 0 0 lb=\'')
				#line.sub!(/lb='/, 'nh=8 nw=8 sh=2 bg=255 255 0 fg=0 0 0 lb=\'')
			when 13
				#purple bk, white font
				line.sub!(/lb='/, 'lk=153 0 204 lc=255 255 255 lb=\'')
			when 14
				#brown bk, white font
				line.sub!(/lb='/, 'lk=153 51 0 lc=255 255 255 lb=\'')
			when 15
				#pale turquoise bk, black font
				line.sub!(/lb='/, 'lk=141 211 199 lc=0 0 0 lb=\'')
			when 16
				#pale yellow bk, black font
				line.sub!(/lb='/, 'lk=255 255 179 lc=0 0 0 lb=\'')
			when 17
				#pale lilac bk, black font
				line.sub!(/lb='/, 'lk=190 186 218 lc=0 0 0 lb=\'')
			when 18
				#salmon bk, black font
				line.sub!(/lb='/, 'lk=251 128 114 lc=0 0 0 lb=\'')
			when 19
				#pale blue bk, black font
				line.sub!(/lb='/, 'lk=128 177 211 lc=0 0 0 lb=\'')
			when 20
				#flesh bk, black font
				line.sub!(/lb='/, 'lk=253 180 98 lc=0 0 0 lb=\'')
			when 21
				#pale green bk, black font
				line.sub!(/lb='/, 'lk=179 222 105 lc=0 0 0 lb=\'')
			when 22
				#pale pink bk, black font
				line.sub!(/lb='/, 'lk=252 205 229 lc=0 0 0 lb=\'')
			when 23
				#pale grey, black font
				line.sub!(/lb='/, 'lk=217 217 217 lc=0 0 0 lb=\'')
			when 24
				#puce bk, black font
				line.sub!(/lb='/, 'lk=188 128 189 lc=0 0 0 lb=\'')
			when 25
				#pale celadon bk, black font
				line.sub!(/lb='/, 'lk=204 236 197 lc=0 0 0 lb=\'')
			when 26
				#pale tan bk, black font
				line.sub!(/lb='/, 'lk=255 237 111 lc=0 0 0 lb=\'')
			else
			      #line.sub!(/lb='/, 'lk=null ll=11 lb=\'')
			      line.sub!(/lb='/, 'nh=0 nw=0 sh=0 bg=null fg=null lb=\'')
			end
			
	else
		#line.sub!(/lb='/, 'lk=null ll=11 lb=\'')
	    line.sub!(/lb='/, 'nh=0 nw=0 sh=0 bg=null fg=null lb=\'')
	end
   node_label.sub!(/\//, '\/')
  # line.sub!(/#{node_label}/, '') # remove label
end

def options(param)
	
	i = 0
	ARGV.each{|arg|
	
		if (arg == '-' + param.to_s)
			return ARGV[i+1]
		else
			return false
		end
		i = i + 1
	}
	
end

def print_help()
		puts "-- ARGVS --"
		puts " -m baps|baps_m|eburst|bk"
		puts " If -m baps"
		puts " 	-it intree.dendro"
		puts " 	-ot baps_outtree.dendro"
		puts " 	-baps_in baps.txt"
		puts " If -m baps_m"
		puts " 	-it intree.dendro"
		puts " 	-ot baps_outtree.dendro"
		puts " 	-baps_in baps.txt"
		puts " 	-baps_lk *filename needs to be specified, no default"
		puts " If -m eburst"
		puts "	-it intree.dendro"
		puts "	-ot eburst_outtree.dendro"
		puts "	-eburst_in eburst.txt"
		puts " If -m bk"
		puts "	-it intree.dendro"
		puts "	-ot bk_outtree.dendro"
		puts "	-bk_in bk.txt"
		puts " 	-m argument with either baps, baps_m, eburst or bk required. Additional arguments available are given below each mode option."
		puts "	Default file names shown after each flag. Lookup tables only required if a merged profile is being used ie the input file has less loci compared to the profiles used to produce the tree."
end
 
if options('m')
	#return the mode to run
	mode = options('m')
	puts "Mode : " << mode
	if mode == 'baps_m'
		if options('it')
			path = options('it')
		else
			path = "intree.dendro"
		end
		
		if options('ot')
			out_path = options('ot')
		else
			out_path = "baps_outtree.dendro"
		end
		
		if options('baps_in')
			baps_path = options('baps_in')
		else
			baps_path = "baps.txt"
		end
		
		if options('baps_lk')
			baps_lkup = options('baps_lk')
		else
			baps_lkup = "baps_lkup.txt"
		end
	elsif mode == 'baps'
		if options('it')
			path = options('it')
		else
			path = "intree.dendro"
		end
		
		if options('ot')
			out_path = options('ot')
		else
			out_path = "baps_outtree.dendro"
		end
		
		if options('baps_in')
			baps_path = options('baps_in')
		else
			baps_path = "baps.txt"
		end
	elsif mode == 'admix'
		if options('it')
			path = options('it')
		else
			path = "intree.dendro"
		end
		
		if options('ot')
			out_path = options('ot')
		else
			out_path = "admix_outtree.dendro"
		end
		
		if options('admix_in')
			admix_path = options('admix_in')
		else
			admix_path = "admix.txt"
		end
		
	elsif mode == 'eburst'
		if options('it')
			path = options('it')
		else
			path = "intree.dendro"
		end
		
		if options('ot')
			out_path = options('ot')
		else
			out_path = "eburst_outtree.dendro"
		end
		
		if options('eburst_in')
			eburst_path = options('eburst_in')
		else
			eburst_path = "eburst.txt"
		end
		
		if options('eburst_lk')
			eburst_lkup = options('eburst_lk')
		else
			eburst_lkup = "eburst_lkup.txt"
		end
	elsif mode == 'bk'
		if options('it')
			path = options('it')
		else
			path = "intree.dendro"
		end
		
		if options('ot')
			out_path = options('ot')
		else
			out_path = "bk_outtree.dendro"
		end
		
		if options('bk_in')
			bk_path = options('bk_in')
		else
			bk_path = "bk.txt"
		end
		
		if options('bk_lk')
			bk_lkup = options('bk_lk')
		else
			bk_lkup = "bk_lkup.txt"
		end
	end
	
	if mode == 'baps_m'
		#Merged BAPS clusters with lookup table
		clusters = Array.new
		lookups = Array.new
		#import the baps clusters
		baps_file = File.open(baps_path)
		baps_file.each do |line|
			if line =~ /Cluster/
				line_array = line.split(':')
				
				cluster = line_array[0].to_s.slice(/\d.|\d/)
				sequence_types_baps = line_array[1].split(',')
				sequence_types_baps.each{|st| st.strip!}
				sequence_types_baps.collect!{|st| st.to_i}
				sequence_types_baps.sort!
				
				this_cluster = Cluster.new(cluster, sequence_types_baps)
				clusters[cluster.to_i] = this_cluster
			end
		end
		baps_file.close
		
		#import the lookup table
		lkup_file = File.open(baps_lkup)
		lkup_file.each do |line|
			
				line_array = line.split(';')
				
				id = line_array[0].to_s.strip
				sequence_types_lkup = line_array[2].split(',')
				sequence_types_lkup.each{|st| st.strip!}
				sequence_types_lkup.collect!{|st| st.to_i}
				sequence_types_lkup.sort!
				
				this_lookup = Lookup.new(id, sequence_types_lkup)
				lookups[id.to_i] = this_lookup
			
		end
		lkup_file.close
		
		#remove any nil fields
		clusters.compact!
		lookups.compact!
		
		#Array of labels
		lb_array = Hash.new
		
		clusters.each do |clust|
			if clust != nil
				clust.cl_sts.each do |st|
					lookups.each do |lk|
						if lk != nil
							if lk.lk_sts.include?(st)
								lb = Label.new(st, clust.cl_id)
								lb.lb_id = lk.lk_id
								lb_array[lb.lb_id] = lb
							end
						end
					end
				end
			end
		end
		
		
		#build the label class
		
		tree_file = File.open(path)
		out_tree = File.open(out_path, 'w')
		finished_merged_ids = Array.new
		tree_file.each do |line|
		  if line =~ /lb='(.+)';/ # line contains a label
		    node_label = $1
		    node_label.strip!
		    if node_label != nil && !lb_array.key?(node_label)
			    line.sub!(/lb='/, 'lk=null lc=0 0 0 lb=\'')
		    end
		    lb_array.each_value do |lb|
			   
			    if lb.lb_id == node_label
				    if !finished_merged_ids.include?(lb.lb_id)
					    colour_line(line, node_label, lb)
					    finished_merged_ids.push(lb.lb_id)
				    else
					    puts "Merged id : " << lb.lb_id.to_s << "    ST : " << lb.lb_st.to_s
				    end
			    end
		
		    end
		
		  end
		  out_tree.write(line)
		end
		tree_file.close
		out_tree.close
	elsif mode == 'baps'
		#normal BAPS mode - no merged profiles or lookup tables
		clusters = Array.new
		
		#import the baps clusters
		baps_file = File.open(baps_path)
		baps_file.each do |line|
			if line =~ /Cluster/
				line_array = line.split(':')
				
				cluster = line_array[0].to_s.slice(/\d.|\d/)
				sequence_types_baps = line_array[1].split(',')
				sequence_types_baps.each{|st| st.strip!}
				sequence_types_baps.collect!{|st| st.to_i}
				sequence_types_baps.sort!
				
				this_cluster = Cluster.new(cluster, sequence_types_baps)
				clusters[cluster.to_i] = this_cluster
			end
		end
		baps_file.close
		#remove any nil fields
		clusters.compact!
		
		#Array of labels
		lb_array = Hash.new
		
		clusters.each do |clust|
			if clust != nil
				clust.cl_sts.each do |st|
					lb = Label.new(st, clust.cl_id)
					lb.lb_id = st.to_s
					lb_array[lb.lb_id] = lb

				end
			end
		end
		
		
		#build the label class
		
		tree_file = File.open(path)
		out_tree = File.open(out_path, 'w')
		tree_file.each do |line|
		  if line =~ /lb='(.+)';/ # line contains a label
		    node_label = $1
		    node_label.strip!
		    
		    if node_label != nil && !lb_array.key?(node_label)
			    #line.sub!(/lb='/, 'lk=null lc=0 0 0 lb=\'')
			    
			    if node_label =~ /\./
			    	    #line.sub!(/lb='/, 'lk=null lb=\'')
			    	    split_line = line.split("lb=")
			    	    line = split_line[0].strip! << ";"
			    	    puts node_label.to_s
			    	    puts line.to_s
		    	    end
		    end
		    lb_array.each_value do |lb|

			    if lb.lb_id.to_s == node_label.to_s
					colour_line(line, node_label, lb)
			    end
		    end
		
		  end
		  out_tree.write(line)
		end
		tree_file.close
		out_tree.close
	elsif mode == "eburst"
		#Eburst takes standard eburst output file as input along with tree
		#normal BAPS mode - no merged profiles or lookup tables
		clusters = Array.new
		new_eburst_group = false
		#import the baps clusters
		eburst_file = File.open(eburst_path)
		#start a new st array
		st_array = Array.new
		#declare cluster variable outside of loop so it can pass between the if statements
		cluster = ""
		eburst_file.each do |line|
			if line =~ /Group/
				#start of new eburst group
				line_array = line.split(':')
				cluster = line_array[0].to_s.slice(/\d.|\d/)
				
				if cluster == nil
					puts line
					
				end
				new_eburst_group = true
				#skip headers
				eburst_file.readline()
				eburst_file.readline()

			end
			if new_eburst_group == true
				
				if line =~ /^\d/
					#line starts with a digit must include the ST
					line_array = line.split('\t')
					#make sure that the slice method has a regex in this order from largest expected number of digits to smallest, otherwise it
					#will just return the first instance of the regex that matches (only the first digit on each line)
					this_st = line_array[0].to_s.slice(/\d..|\d.|\d/)
					this_st.strip!
					st_array << this_st.to_i
					
				elsif line =~ /^\s*$/
					#empty line end of eburst group - reset new_eburst_group boolean to false
					new_eburst_group = false
					#build cluster
					st_array.compact!
					st_array.sort!
					puts cluster
					this_cluster = Cluster.new(cluster, st_array)
					clusters[cluster.to_i] = this_cluster
					
					st_array = Array.new
				end
				
			end
		end
		
		eburst_file.close
		#remove any nil fields
		clusters.compact!
		#Array of labels
		lb_array = Hash.new
		
		clusters.each do |clust|
			if clust != nil
				clust.cl_sts.each do |st|
					lb = Label.new(st, clust.cl_id)
					lb.lb_id = st.to_s
					lb_array[lb.lb_id] = lb
				end
			end
		end

		#build the label class
		
		tree_file = File.open(path)
		out_tree = File.open(out_path, 'w')
		tree_file.each do |line|
		  if line =~ /lb='(.+)';/ # line contains a label
		    node_label = $1
		    node_label.strip!
		    
		    if node_label != nil && !lb_array.key?(node_label)
			    line.sub!(/lb='/, 'lk=null lc=0 0 0 lb=\'')
		    end
		    lb_array.each_value do |lb|

			    if lb.lb_id.to_s == node_label.to_s
					colour_line(line, node_label, lb)
			    end
		    end
		
		  end
		  out_tree.write(line)
		end
		tree_file.close
		out_tree.close

	elsif mode == "bk"
		#BK input file starts with number of nucleotides threshold on the first line (usually 7 or 9 depending on the number of loci in the profile)
		#The start of each BK cluster is then marked with '>' followed by the cluster id number and the number of constituent profiles (seperated by a colon)
		#the following lines are the constituent ST / profile ID number followed by the profile (seperated by a colon)
		#E.g.
		#9
		#>1 : 220
		#2 : 6,10,19,3,19,4,9
		#4 : 1,10,19,1,9,4,1

		#normal BAPS mode - no merged profiles or lookup tables
		clusters = Array.new
		new_bk_group = false
		#import the baps clusters
		bk_file = File.open(bk_path)
		#start a new st array
		st_array = Array.new
		#declare cluster variable outside of loop so it can pass between the if statements
		cluster = ""
		bk_file.each do |line|		
				
				if (line =~ /^\d/) && !(line =~ />/)
					if new_bk_group == true
						#line starts with a digit and doesnt include '>' must include the ST
						line_array = line.split(':')
						#make sure that the slice method has a regex in this order from largest expected number of digits to smallest, otherwise it
						#will just return the first instance of the regex that matches (only the first digit on each line)
						this_st = line_array[0].to_s.slice(/\d..|\d.|\d/)
						this_st.strip!
						st_array << this_st.to_i
					end
				elsif line =~ />/
					if st_array.length > 0
						#st_array is full so make the last cluster before starting this new one
						st_array.compact!
						st_array.sort!
						this_cluster = Cluster.new(cluster, st_array)
						clusters[cluster.to_i] = this_cluster
						#remake st_array
						st_array = Array.new
					end
					#start of new BK group
					line_array = line.split(':')
					cluster = line_array[0].to_s.slice(/\d.|\d/)
					
					if cluster == nil
						puts line
					end
					new_bk_group = true
				end
		end
		
		bk_file.close
		#remove any nil fields
		clusters.compact!
		#Array of labels
		lb_array = Hash.new
		
		clusters.each do |clust|
			if clust != nil
				clust.cl_sts.each do |st|
					lb = Label.new(st, clust.cl_id)
					lb.lb_id = st.to_s
					lb_array[lb.lb_id] = lb
				end
			end
		end

		#build the label class
		
		tree_file = File.open(path)
		out_tree = File.open(out_path, 'w')
		tree_file.each do |line|
		  if line =~ /lb='(.+)';/ # line contains a label
		    node_label = $1
		    node_label.strip!
		    
		    if node_label != nil && !lb_array.key?(node_label)
			    line.sub!(/lb='/, 'lk=null lc=0 0 0 lb=\'')
		    end
		    lb_array.each_value do |lb|

			    if lb.lb_id.to_s == node_label.to_s
					colour_line(line, node_label, lb)
			    end
		    end
		
		  end
		  out_tree.write(line)
		end
		puts "--- Summary ---"
		puts clusters.length.to_s << " Clusters labelled."
		puts lb_array.length.to_s << " Labels processed."
		puts "Output file : " << out_path
		tree_file.close
		out_tree.close
		
	elsif mode == "admix"
		#normal BAPS mode - no merged profiles or lookup tables
		clusters = Array.new
		
		#import the baps clusters
		admix_file = File.open(admix_path)
		header_array = Array.new
		pop_array = Array.new
		admix_file.each do |line|		

			if line =~ /^Index/
					#start of the admix clustering table 
					#read in header line and find number of populations
					header_array = line.split(" ")
					#extract population id numbers from headers
					
					pop_array = header_array[2..-2]
					
					puts pop_array.inspect
					#skip blank lines, read in cluster info for each ST
					admix_file.each do |table_line|
						if !(table_line =~ /^\s*$/)
							#not a blank line
							this_line = table_line.split(" ")
							
							this_pop_array = this_line[2..-2]
							#find the highest value out of the populations - this should be the one that the ST is assigned to
							pop_val = this_pop_array[0].to_f
							pop_id = pop_array[0].to_i
							pop_count = pop_id
							this_pop_array.each do |this_val|
								if this_val.to_f > pop_val.to_f
									pop_val = this_val
									pop_id = pop_count
								end
								pop_count = pop_count + 1
							end
							#get the P value
							p_val = this_line[-1].to_f
							#get the ST
							st_val = this_line[1]
							if (p_val.to_f > 0.05) && (pop_val.to_f > 0.5)
								#if p_val is greater than the cutoff and highest pop_val is greater than 0.5
								#ie the ST can be assigned to one definite population
								#construct label
								if clusters[pop_id.to_i] != nil
									#if the population exists, get cluster object and push new st onto the st array
									this_cluster = clusters[pop_id.to_i]
									this_cluster.cl_sts.push(st_val)
									clusters[pop_id.to_i] = this_cluster
								else
									#else make a new population
									new_st_array = Array[st_val]
									this_cluster = Cluster.new(pop_id.to_i, new_st_array)
									clusters[pop_id.to_i] = this_cluster
								end

							end
							

						end
					
					end

			end
		end
		clusters.compact!
		
		admix_file.close
		#Array of labels
		lb_array = Hash.new
		
		clusters.each do |clust|
			if clust != nil
				clust.cl_sts.each do |st|
					lb = Label.new(st, clust.cl_id)
					lb.lb_id = st.to_s
					lb_array[lb.lb_id] = lb
				end
			end
		end

		#build the label class
		
		tree_file = File.open(path)
		out_tree = File.open(out_path, 'w')
		tree_file.each do |line|
		  if line =~ /lb='(.+)';/ # line contains a label
		    node_label = $1
		    node_label.strip!
		    
		    if node_label != nil && !lb_array.key?(node_label)
			    # line.sub!(/lb='/, 'nh=1 nw=1 sh=2 bg=0 0 0 fg=0 0 0 lb=\'')
			    line.sub!(/lb='/, 'lk=null lc=0 0 0 lb=\'')
		    end
		    lb_array.each_value do |lb|

			    if lb.lb_id.to_s == node_label.to_s
					colour_line(line, node_label, lb)
			    end
		    end
		
		  end
		  out_tree.write(line)
		end
		puts "--- Summary ---"
		puts clusters.length.to_s << " Clusters labelled."
		puts lb_array.length.to_s << " Labels processed."
		puts "Output file : " << out_path
		tree_file.close
		out_tree.close
		
	else
		#print help file
		print_help()
	end
else
	#print help file
	print_help()
end
