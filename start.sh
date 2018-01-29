( rails db:migrate || rails db:setup ) && \
rails cthit:update_printers && \
rails s -b 0.0.0.0
