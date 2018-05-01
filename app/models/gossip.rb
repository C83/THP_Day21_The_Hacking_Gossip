class Gossip < ApplicationRecord
	# destroy permettra de supprimer les commentaires du gossip quand on supprimera le gossip
	has_many :comments, dependent: :destroy
end
