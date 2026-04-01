module UserHelper
    def full_name(fname, lname)
        [fname, lname].select(&:present?).join(" ")
    end
end
