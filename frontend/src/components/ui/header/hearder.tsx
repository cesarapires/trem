interface HeaderProps {
  title: string;
  children?: React.ReactNode;
}

const Header: React.FC<HeaderProps> = ({ title, children }) => {
  return (
    <div className="h-15 bg-orange-400 px-3 rounded-md flex justify-between items-center text-white">
      <h2 className="text-xl font-semibold tracking-tight">{title}</h2>
      {children && <div className="flex space-x-2">{children}</div>}
    </div>
  );
};

export default Header;
